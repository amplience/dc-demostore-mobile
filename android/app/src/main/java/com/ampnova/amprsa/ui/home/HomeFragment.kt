package com.ampnova.amprsa.ui.home

import android.net.Uri
import android.os.Bundle
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.ViewModelProvider
import com.ampnova.amprsa.databinding.FragmentHomeBinding
import com.ampnova.amprsa.ui.SharedViewModel
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.bumptech.glide.Glide
import com.android.volley.toolbox.Volley
import org.json.JSONObject

class HomeFragment : Fragment() {

    private var _binding: FragmentHomeBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    private val model: SharedViewModel by activityViewModels()
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val textView: TextView = binding.textView
        val buttonView: Button = binding.button
        var separator = binding.divider
        val imageView: ImageView = binding.imageView

        textView.visibility = View.INVISIBLE
        buttonView.visibility = View.INVISIBLE
        separator.visibility = View.INVISIBLE

        model.contentURL.observe(viewLifecycleOwner) { url ->
            if (url != null && url.isNotEmpty()) {
                println("[amprsa] new Volley: $url")
                Volley.newRequestQueue(context).add(StringRequest(Request.Method.GET, url,
                    { response ->
                        println("response: $response")

                        val json: JSONObject = JSONObject(response)
                        val content = json.getJSONObject("content")
                        val i = content.getJSONObject("image")
                        val imageWrapper = i.getJSONObject("img").getJSONObject("image")
                        val image = imageWrapper.getJSONObject("image")
                        var imageQuery = ""
                        val poi = imageWrapper.getJSONObject("poi")
                        var poix = poi.getDouble("x")
                        var poiy = poi.getDouble("y")

                        if (poix < 0) {
                            poix = 0.5
                        }

                        if (poiy < 0) {
                            poiy = 0.5
                        }

                        if (imageWrapper.has("query")) {
                            imageQuery = "&" + imageWrapper.getString("query")
                        }

                        val imageUrl = "https://${image.getString("defaultHost")}/i/${image.getString("endpoint")}/${image.getString("name")}.webp?w=1536&sm=aspect&scaleFit=poi&aspect=1:1&strip=true&poi=${poix},${poiy},0,0${imageQuery}"

                        Glide.with(this).load(imageUrl).into(imageView);
                        textView.text = content.getJSONObject("bannerText").getString("header")
                        buttonView.text = content.getJSONObject("ctaSettings").getString("buttonText")

                        textView.gravity = Gravity.CENTER_HORIZONTAL
                        textView.visibility = View.VISIBLE
                        buttonView.visibility = View.VISIBLE
                        separator.visibility = View.VISIBLE
                    },
                    { textView.text = "That didn't work!" }))
            }
        }
    }
}
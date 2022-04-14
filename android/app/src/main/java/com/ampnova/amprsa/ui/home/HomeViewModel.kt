package com.ampnova.amprsa.ui.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.ampnova.amprsa.ui.SharedViewModel

class HomeViewModel : SharedViewModel() {

    private val _text = MutableLiveData<String>().apply {
        value = "This is home Fragment"
    }
    val text: LiveData<String> = _text

    private val _imageUrl = MutableLiveData<String>().apply {
        value = "https://cdn-icons-png.flaticon.com/512/180/180954.png"
    }
    val imageUrl: LiveData<String> = _imageUrl
}
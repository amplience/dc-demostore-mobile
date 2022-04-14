package com.ampnova.amprsa.ui

import android.content.SharedPreferences
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

open class SharedViewModel: ViewModel() {
    var contentURL = MutableLiveData<String>()

    fun setPreferences(prefs: SharedPreferences) {
        var cms = "r2tmue06tnfg191anlfcy76n6.staging.bigcontent.io"
        var contentId = "77d86f90-1af3-4b34-a859-5ffaa7b1cb72"
        var locale = "en-US"

        if (prefs != null) {
            cms = prefs.getString("cms", cms).toString()
            contentId = prefs.getString("contentId", contentId).toString()
            locale = prefs.getString("locale", locale).toString()
        }

        val url = "https://$cms/content/id/$contentId?locale=$locale"
        this.contentURL.value = url
        println("[amprsa] set url = ${this.contentURL}")
    }
}
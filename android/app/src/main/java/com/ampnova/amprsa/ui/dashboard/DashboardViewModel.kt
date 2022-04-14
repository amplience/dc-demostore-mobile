package com.ampnova.amprsa.ui.dashboard

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.ampnova.amprsa.ui.SharedViewModel

class DashboardViewModel : SharedViewModel() {

    private val _text = MutableLiveData<String>().apply {
        value = "This is dashboard Fragment"
    }
    val text: LiveData<String> = _text

    private val _isAppetize = MutableLiveData<Boolean>().apply {
        value = false
    }
    val isAppetize: LiveData<Boolean> = _isAppetize
}
package com.ampnova.amprsa

import android.os.Bundle
import androidx.activity.viewModels
import com.google.android.material.bottomnavigation.BottomNavigationView
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.MutableLiveData
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.setupActionBarWithNavController
import androidx.navigation.ui.setupWithNavController
import com.ampnova.amprsa.databinding.ActivityMainBinding
import com.ampnova.amprsa.ui.SharedViewModel
import com.ampnova.amprsa.ui.dashboard.DashboardViewModel
import com.ampnova.amprsa.ui.home.HomeFragment
import com.ampnova.amprsa.ui.home.HomeViewModel

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val navView: BottomNavigationView = binding.navView

        val navController = findNavController(R.id.nav_host_fragment_activity_main)
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        val appBarConfiguration = AppBarConfiguration(
            setOf(
                R.id.navigation_home, R.id.navigation_dashboard, R.id.navigation_notifications
            )
        )
        setupActionBarWithNavController(navController, appBarConfiguration)
        navView.setupWithNavController(navController)
        navView.selectedItemId = R.id.navigation_home

        val model: HomeViewModel by viewModels()
        val sharedModel: SharedViewModel by viewModels()

        val sharedPrefs = applicationContext.getSharedPreferences("prefs.db", 0)
        sharedModel.setPreferences(sharedPrefs)
    }
}
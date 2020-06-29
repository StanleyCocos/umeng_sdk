package com.example.umeng_sdk_example;

import android.os.Bundle;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import com.umeng.analytics.MobclickAgent;

public class MainActivity extends FlutterActivity {

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    com.example.umeng_sdk.UmengSdkPlugin.setContext(this);
    android.util.Log.i("UMLog", "onCreate@MainActivity");
  }

  @Override
	protected void onPause() {
	    super.onPause();
	    MobclickAgent.onPause(this);
	    android.util.Log.i("UMLog", "onPause@MainActivity");
	}

    @Override
    protected void onResume() {
        super.onResume();
        MobclickAgent.onResume(this);
        android.util.Log.i("UMLog", "onResume@MainActivity");
    }
}


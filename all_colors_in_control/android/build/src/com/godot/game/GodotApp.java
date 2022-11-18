/*************************************************************************/
/*  GodotApp.java                                                        */
/*************************************************************************/
/*                       This file is part of:                           */
/*                           GODOT ENGINE                                */
/*                      https://godotengine.org                          */
/*************************************************************************/
/* Copyright (c) 2007-2022 Juan Linietsky, Ariel Manzur.                 */
/* Copyright (c) 2014-2022 Godot Engine contributors (cf. AUTHORS.md).   */
/*                                                                       */
/* Permission is hereby granted, free of charge, to any person obtaining */
/* a copy of this software and associated documentation files (the       */
/* "Software"), to deal in the Software without restriction, including   */
/* without limitation the rights to use, copy, modify, merge, publish,   */
/* distribute, sublicense, and/or sell copies of the Software, and to    */
/* permit persons to whom the Software is furnished to do so, subject to */
/* the following conditions:                                             */
/*                                                                       */
/* The above copyright notice and this permission notice shall be        */
/* included in all copies or substantial portions of the Software.       */
/*                                                                       */
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,       */
/* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF    */
/* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.*/
/* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  */
/* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  */
/* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE     */
/* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                */
/*************************************************************************/

package com.godot.game;

import org.godotengine.godot.FullScreenGodotApp;

import android.os.Bundle;
import android.view.ViewGroup;

import com.openmediation.sdk.InitCallback;
import com.openmediation.sdk.InitConfiguration;
import com.openmediation.sdk.OmAds;
import com.openmediation.sdk.splash.SplashAd;
import com.openmediation.sdk.utils.error.Error;
import com.openmediation.sdk.splash.SplashAd;
import com.openmediation.sdk.splash.SplashAdListener;
import com.openmediation.sdk.utils.error.Error;

/**
 * Template activity for Godot Android custom builds.
 * Feel free to extend and modify this class for your custom logic.
 */
public class GodotApp extends FullScreenGodotApp {
	@Override
	public void onCreate(Bundle savedInstanceState) {
		setTheme(R.style.GodotAppMainTheme);
		super.onCreate(savedInstanceState);

		InitConfiguration configuration = new InitConfiguration.Builder()
				.appKey("BdPpAp3ooXL8wSUldSnYjUIIM2PrwWRa")
				.logEnable(false)
				.build();
		OmAds.init(configuration, new InitCallback() {

			// Invoked when the initialization is successful.
			@Override
			public void onSuccess() {

				String placementId = "12888";
				SplashAd.loadAd(placementId);
				/*
				if (SplashAd.isReady(placementId)) {
					ViewGroup viewGroup;
					SplashAd.showAd(placementId, viewGroup);
				}

				 */
			}

			// Invoked when the initialization is failed.
			@Override
			public void onError(Error error) {
			}

		});
		SplashAd.setSplashAdListener("12888", new SplashAdListener() {
				@Override
				public void onSplashAdLoaded(String placementId) {
					//在Splashload 成功之后可以展示Splash
					//假设加载完成后立即展示
					SplashAd.showAd(placementId);
				}

				@Override
				public void onSplashAdFailed(String placementId, Error error) {

				}

				@Override
				public void onSplashAdClicked(String placementId) {

				}

				@Override
				public void onSplashAdShowed(String placementId) {

				}

				@Override
				public void onSplashAdShowFailed(String placementId, Error error) {

				}

				@Override
				public void onSplashAdTick(String placementId, long millisUntilFinished) {

				}

				@Override
				public void onSplashAdDismissed(String placementId) {

				}
			});

	}
	@Override
	protected void onResume() {
		super.onResume();
		OmAds.onResume(this);
	}
	@Override
	protected void onPause() {
		super.onPause();
		OmAds.onPause(this);
	}
}

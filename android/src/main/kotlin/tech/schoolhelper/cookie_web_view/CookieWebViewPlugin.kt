package tech.schoolhelper.cookie_web_view

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.graphics.Point
import android.util.Log
import android.webkit.CookieManager
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.FrameLayout
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class CookieWebViewPlugin(
    private val activity: Activity,
    private val context: Context
) : MethodCallHandler {

    companion object {
        lateinit var channel: MethodChannel

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            channel = MethodChannel(registrar.messenger(), "cookie_web_view")
            val instance = CookieWebViewPlugin(registrar.activity(), registrar.activeContext())
            channel.setMethodCallHandler(instance)
        }
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        when (call.method) {
            "openWebView" -> openUrl(call)
            else -> result.notImplemented()
        }
    }

    @SuppressLint("SetJavaScriptEnabled")
    private fun openUrl(
        call: MethodCall
    ) {
        val url = call.argument<String>("url")

        val display = activity.windowManager.defaultDisplay
        val size = Point()
        display.getSize(size)
        val width = size.x
        val height = size.y
        val params = FrameLayout.LayoutParams(width, height)

        val webView = WebView(context)

        activity.addContentView(webView, params)

        webView.settings.javaScriptEnabled = true
        webView.webViewClient = object : WebViewClient() {
            override fun onPageFinished(
                view: WebView?,
                url: String?
            ) {
                super.onPageFinished(view, url)
                val cookie = CookieManager.getInstance()
                    .getCookie(url)
                Log.e("TAG", cookie)
                channel.invokeMethod("onCookieChange", cookie)
            }
        }

        webView.loadUrl(url)
    }
}

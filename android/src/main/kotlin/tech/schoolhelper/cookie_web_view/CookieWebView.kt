package tech.schoolhelper.cookie_web_view

import android.annotation.SuppressLint
import android.content.Context
import android.view.View
import android.webkit.CookieManager
import android.webkit.WebView
import android.webkit.WebViewClient
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class CookieWebView(context: Context, messenger: BinaryMessenger, id: Int) : PlatformView, MethodChannel.MethodCallHandler {

    private var webView: WebView = WebView(context)
    private var methodChannel: MethodChannel = MethodChannel(messenger, "cookie_web_view_$id")

    init {
        methodChannel.setMethodCallHandler(this)
    }

    @SuppressLint("SetJavaScriptEnabled")
    override fun getView(): View {
        webView.settings.javaScriptEnabled = true
        webView.webViewClient = object : WebViewClient() {
            override fun onPageFinished(
                    view: WebView?,
                    url: String?
            ) {
                super.onPageFinished(view, url)
                val cookie = CookieManager.getInstance()
                        .getCookie(url)

                methodChannel.invokeMethod("onCookieChange", cookie)
            }
        }
        return webView
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "open" -> {
                val url = methodCall.argument<String>("url")
                webView.loadUrl(url)
                result.success(null)
            }
            else -> result.notImplemented()
        }

    }

    override fun dispose() {}

}
package tech.schoolhelper.cookie_web_view

import io.flutter.plugin.common.PluginRegistry.Registrar

class CookieWebViewPlugin {

    companion object {

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            registrar
                    .platformViewRegistry()
                    .registerViewFactory(
                            "cookie_web_view", WebViewViewFactory(registrar.messenger()))
        }
    }
}

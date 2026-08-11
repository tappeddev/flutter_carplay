package com.oguzhnatly.flutter_android_auto

data class FAAAction(
    val elementId: String,
    val title: String? = null,
    val imageUrl: String? = null,
    val imageData: ByteArray? = null,
    val imageTint: FAAImageTint? = null,
    val isOnPressListenerActive: Boolean = false,
) {
    companion object {
        fun fromJson(map: Map<String, Any?>): FAAAction {
            return FAAAction(
                elementId = map["_elementId"] as? String ?: "",
                title = map["title"] as? String,
                imageUrl = map["imageUrl"] as? String,
                imageData = map["imageData"] as? ByteArray,
                imageTint = FAAImageTint.fromJson(map["imageTint"] as? Map<String, Any?>),
                isOnPressListenerActive = map["onPress"] as? Boolean ?: false,
            )
        }
    }
}

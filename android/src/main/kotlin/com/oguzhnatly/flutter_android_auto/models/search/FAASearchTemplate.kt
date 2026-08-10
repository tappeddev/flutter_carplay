package com.oguzhnatly.flutter_android_auto

data class FAASearchTemplate(
    val elementId: String,
    val items: List<FAAListItem>,
    val searchHint: String?,
    val isLoading: Boolean,
    val showKeyboardByDefault: Boolean,
) {
    companion object {
        fun fromJson(map: Map<String, Any?>): FAASearchTemplate {
            val items = (map["items"] as? List<*>)?.mapNotNull {
                (it as? Map<*, *>)?.mapKeys { entry -> entry.key.toString() }
                    ?.let(FAAListItem::fromJson)
            } ?: emptyList()

            return FAASearchTemplate(
                elementId = map["_elementId"] as? String ?: "",
                items = items,
                searchHint = map["searchHint"] as? String,
                isLoading = map["isLoading"] as? Boolean ?: false,
                showKeyboardByDefault = map["showKeyboardByDefault"] as? Boolean ?: true,
            )
        }
    }
}

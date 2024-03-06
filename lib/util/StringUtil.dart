class StringUtil {

  static bool isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static String strClean(String str) {
    return str
        .replaceAll("<pre>", "")
        .replaceAll("</pre>", "")
        .replaceAll("<code>", "")
        .replaceAll("</code>", "")
        .replaceAll("\n", "")
        .replaceAll("\r", "")
        .replaceAll(RegExp("(<em[^>]*>)|(</em>)"), "")
        .replaceAll("&ndash;", "–")
        .replaceAll("&mdash;", "—")
        .replaceAll("&lsquo;", "‘")
        .replaceAll("&rsquo;", "’")
        .replaceAll("&sbquo;", "‚")
        .replaceAll("&ldquo;", "“")
        .replaceAll("&rdquo;", "”")
        .replaceAll("&bdquo;", "„")
        .replaceAll("&permil;", "‰")
        .replaceAll("&lsaquo;", "‹")
        .replaceAll("&rsaquo;", "›")
        .replaceAll("&euro;", "€")
        .replaceAll("<p>", "")
        .replaceAll("</p>", "")
        .replaceAll("</br>", "\n")
        .replaceAll("<br>", "\n")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">")
        .replaceAll("&nbsp;", " ")
        .replaceAll("&amp;", "&")
        .replaceAll("&quot;", "\"")
        .replaceAll("&yen;", "¥");
  }
}

function htmlEncode(str) {
    // This must be done in a proper order to achive desired results.
    str = this.replaceAll(str, "&", "&amp;");
    str = this.replaceAll(str, "<", "&lt;");
    str = this.replaceAll(str, ">", "&gt;");
    str = this.replaceAll(str, " ", "&nbsp;");
    return str;
}


function replaceAll(str, subStr, newStr) {
    var offset = 0;
    var index = str.indexOf(subStr);
    while (index != -1) {
        str = str.substr(0, index) + newStr + str.substr(index + subStr.length);
        offset = index + newStr.length;
        index = str.indexOf(subStr, offset);
    }
    return str;
}
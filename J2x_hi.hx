/*
J2X -- Transliterate Japanese words in kana(hiragana or katakana) into other writing systems
------------------------------
Hindi
------------------------------
Script: Devanagari
Language: Hindi

*/

@:expose
@:keep
class J2x_hi extends J2x_lang{
	 // Counterpart of phonKana in J2x_lang
	static var hiKana = [
		"अ", "इ", "उ", "ए", "ओ", "या", "यु", "यॆ", "यॊ",
		"का", "कि", "कु", "के", "को", "क्या", "क्यु", "क्यॆ", "क्यॊ",
		"गा", "गि", "गु", "गे", "गो", "ग्या", "ग्यु", "ग्यॆ", "ग्यॊ",
		"सा", "सि", "सु", "से", "सो", "स्या", "स्यु", "स्यॆ", "स्यॊ",
		"शा", "शि", "शु", "शे", "शो", "शा", "शु", "शे", "शो",
		"ज़ा", "ज़ि", "ज़ु", "ज़े", "ज़ो", "ज़्या", "ज़्यु", "ज़्यॆ", "ज़्यॊ",
		"जा", "जि", "जु", "जे", "जो", "जा", "जु", "जे", "जो",
		"ता", "ति", "तु", "ते", "तो", "त्या", "त्यु", "त्यॆ", "त्यॊ",
		"चा", "चि", "चु", "चे", "चो", "चा", "चु", "चे", "चो",
		"त्सा", "त्सि", "त्सु", "त्से", "त्सो", "त्स्या", "त्स्यु", "त्स्यॆ", "त्स्यॊ",
		"दा", "दि", "दु", "दे", "दो", "द्या", "द्यु", "द्यॆ", "द्यॊ",
		"ना", "नि", "नु", "ने", "नो", "न्या", "न्यु", "न्यॆ", "न्यॊ",
		"हा", "हि", "हु", "हे", "हो", "ह्या", "ह्यु", "ह्यॆ", "ह्यॊ",
		"फ़ा", "फ़ि", "फ़ु", "फ़े", "फ़ोया", "फ़्यु", "फ़्यॆ", "फ़्", "फ़्यॊ",
		"बा", "बि", "बु", "बे", "बो", "ब्या", "ब्यु", "ब्यॆ", "ब्यॊ",
		"वा", "वि", "वु", "वे", "वो", "व्या", "व्यु", "व्यॆ", "व्यॊ",
		"पा", "पि", "पु", "पे", "पो", "प्या", "प्यु", "प्यॆ", "प्यॊ",
		"मा", "मि", "मु", "मे", "मो", "म्या", "म्यु", "म्यॆ", "म्यॊ",
		"या", "यि", "यु", "ये", "यो", "या", "यु", "यॆ", "यॊ",
		"रा", "रि", "रु", "रे", "रो", "र्या", "र्यु", "र्यॆ", "र्यॊ",
		"वा", "वि", "वु", "वे", "वो", "व्या", "व्यु", "व्यॆ", "व्यॊ",
		"न्", "क्वा", "क्वि", "क्वे", "क्वो", "ग्वा", "ग्वि", "ग्वे", "ग्वो"
	];
	static var phonKanaAlt = [
		"ka", "ki", "ku", "ke", "ko", "kya", "kyu", "kye", "kyo",
		"ta", "ti", "tu", "te", "to", "tya", "tyu", "tye", "tyo",
		"cha", "chi", "chu", "che", "cho", "cha", "chu", "che", "cho"
	];
	static var krKanaAlt = [
		"가", "기", "구", "게", "고", "갸", "규", "계", "교",
		"다", "디", "두", "데", "도", "댜", "듀", "뎨", "됴",
		"자", "지", "주", "제", "조", "쟈", "쥬", "졔", "죠"
	];
	
	static inline function u(c:Int){
		return String.fromCharCode(c);
	}
	
	
	public static function phon2x(sPhonArray:Array<String>){
		var ret = [];
		var word_head = true;
		var i = 0;
		while(i < sPhonArray.length){
			var syl = sPhonArray[i];
			var idx = J2x_lang.phonKana.indexOf(syl);
			if(idx != -1){
				var idx2 = phonKanaAlt.indexOf(syl);
				if(word_head && idx2 != -1){
					ret.push(krKanaAlt[idx2]);
				}else{
					if(syl == "n#"){
						var s = ret[ret.length - 1];
						ret[ret.length - 1] = String.fromCharCode(s.charCodeAt(0) + 4);
					}else{
						ret.push(krKana[idx]);
					}
				}
				word_head = false;
			}else{
				word_head = true;
				var s = syl.charAt(0);
				if(s == "%"){
					ret.push(syl.substring(1, syl.length));
				}else if(syl == "#tsu"){
					var s2 = ret[ret.length - 1];
					ret[ret.length - 1] = String.fromCharCode(s2.charCodeAt(0) + 19);
					word_head = false;
				}else if(s != "#"){
					// small 'tsu' etc. is ignored...
					ret.push(syl);
				}
			}
			i++;
		}
		return ret.join("");
	}
	
	
}
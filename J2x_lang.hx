/*
J2X -- Transliterate Japanese words in kana(hiragana or katakana) into other writing systems
------------------------------
Romaji Class & Base Class for other scripts
------------------------------
Script: Romaji
Language: Japanese

*/

@:expose
@:keep
class J2x_lang{
	/* 
		U+304x		ぁ	あ	ぃ	い	ぅ	う	ぇ	え	ぉ	お	か	が	き	ぎ	く
		U+305x	ぐ	け	げ	こ	ご	さ	ざ	し	じ	す	ず	せ	ぜ	そ	ぞ	た
		U+306x	だ	ち	ぢ	っ	つ	づ	て	で	と	ど	な	に	ぬ	ね	の	は
		U+307x	ば	ぱ	ひ	び	ぴ	ふ	ぶ	ぷ	へ	べ	ぺ	ほ	ぼ	ぽ	ま	み
		U+308x	む	め	も	ゃ	や	ゅ	ゆ	ょ	よ	ら	り	る	れ	ろ	ゎ	わ
		U+309x	ゐ	ゑ	を	ん	ゔ	ゕ	ゖ			゙	゚	゛	゜	ゝ	ゞ	ゟ
		U+30Ax	゠	ァ	ア	ィ	イ	ゥ	ウ	ェ	エ	ォ	オ	カ	ガ	キ	ギ	ク
		U+30Bx	グ	ケ	ゲ	コ	ゴ	サ	ザ	シ	ジ	ス	ズ	セ	ゼ	ソ	ゾ	タ
		U+30Cx	ダ	チ	ヂ	ッ	ツ	ヅ	テ	デ	ト	ド	ナ	ニ	ヌ	ネ	ノ	ハ
		U+30Dx	バ	パ	ヒ	ビ	ピ	フ	ブ	プ	ヘ	ベ	ペ	ホ	ボ	ポ	マ	ミ
		U+30Ex	ム	メ	モ	ャ	ヤ	ュ	ユ	ョ	ヨ	ラ	リ	ル	レ	ロ	ヮ	ワ
		U+30Fx	ヰ	ヱ	ヲ	ン	ヴ	ヵ	ヶ	ヷ	ヸ	ヹ	ヺ	・	ー	ヽ	ヾ	ヿ
	*/
	static var uniKana = [
		"_", "@a", "a", "@i", "i", "@u", "u", "@e", "e", "@o", "o", "ka", "ga", "ki", "gi", "ku", 
		"gu", "ke", "ge", "ko", "go", "sa", "za", "shi", "ji", "su", "zu", "se", "ze", "so", "zo", "ta", 
		"da", "chi", "ji", "#tsu", "tsu", "zu", "te", "de", "to", "do", "na", "ni", "nu", "ne", "no", "ha", 
		"ba", "pa", "hi", "bi", "pi", "fu", "bu", "pu", "he", "be", "pe", "ho", "bo", "po", "ma", "mi", 
		"mu", "me", "mo", "@ya", "ya", "@yu", "yu", "@yo", "yo", "ra", "ri", "ru", "re", "ro", "#wa", "wa", 
		"wi", "we", "wo", "n#", "vu", "#ka", "#ke", "va", "vi", "ve", "vo", "?", "?", "?", "?", "?"
	];
	static var idan = ["i", "ki", "gi", "si", "shi", "zi", "ji", "ti", "chi", "tsi", "di", "ni", "hi", "fi", "bi", "vi", "pi", "mi", "yi", "ri", "wi"];
	static var udan = ["u", "tsu", "fu", "vu"]; // Other combination like 'テュ' or 'トゥ' is ignored...
	static var odan = ["o", "ko", "kyo", "so", "no", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""];
	// 'sha' is しゃ, whereas 'sya' is すぃゃ? ( IPA: /sja/ )
	static var phonKana = [
		"a", "i", "u", "e", "o", "ya", "yu", "ye", "yo",
		"ka", "ki", "ku", "ke", "ko", "kya", "kyu", "kye", "kyo", 
		"ga", "gi", "gu", "ge", "go", "gya", "gyu", "gye", "gyo", 
		"sa", "si", "su", "se", "so", "sya", "syu", "sye", "syo",
		"sha", "shi", "shu", "she", "sho", "sha", "shu", "she", "sho", 
		"za", "zi", "zu", "ze", "zo", "zya", "zyu", "zye", "zyo",
		"ja", "ji", "ju", "je", "jo", "ja", "ju", "je", "jo",
		"ta", "ti", "tu", "te", "to", "tya", "tyu", "tye", "tyo",
		"cha", "chi", "chu", "che", "cho", "cha", "chu", "che", "cho", 
		"tsa", "tsi", "tsu", "tse", "tso", "tsya", "tsyu", "tsye", "tsyo",
		"da", "di", "du", "de", "do", "dya", "dyu", "dye", "dyo", 
		"na", "ni", "nu", "ne", "no", "nya", "nyu", "nye", "nyo",
		"ha", "hi", "hu", "he", "ho", "hya", "hyu", "hye", "hyo",
		"fa", "fi", "fu", "fe", "fo", "fya", "fyu", "fye", "fyo",
		"ba", "bi", "bu", "be", "bo", "bya", "byu", "bye", "byo",
		"va", "vi", "vu", "ve", "vo", "vya", "vyu", "vye", "vyo",
		"pa", "pi", "pu", "pe", "po", "pya", "pyu", "pye", "pyo",
		"ma", "mi", "mu", "me", "mo", "mya", "myu", "mye", "myo",
		"ya", "yi", "yu", "ye", "yo", "ya", "yu", "ye", "yo",
		"ra", "ri", "ru", "re", "ro", "rya", "ryu", "rye", "ryo",
		"wa", "wi", "wu", "we", "wo", "wya", "wyu", "wye", "wyo",
		"n#", "kwa", "kwi", "kwe", "kwo", "gwa", "gwi", "gwe", "gwo"
	];
	
	
	public static function u(c:Int){
		return String.fromCharCode(c);
	}
	
	private static function getC(s:String, idx:Int){
		var c = s.charCodeAt(idx);
		if(c > 0x30a0){
			// Katakana
			return c - 0x30a0;
		}else{
			// Hiragana
			return c - 0x3040;
		}
	}
	
	public static function phon2roman(sPhonArray:Array<String>, ?capitalizeIntial:Bool = true){
		var ar = [];
		for(i in 0...sPhonArray.length){
			var syl = sPhonArray[i];
			if(syl == "#tsu" && i < sPhonArray.length - 1){
				ar.push(sPhonArray[i + 1].charAt(0));
			}else if(syl == "n#"){
				ar.push("n");
			}else if(syl == "#-" && i != 0){
				ar.push(sPhonArray[i - 1].charAt(sPhonArray[i - 1].length - 1));
			}else{
				ar.push(syl);
			}
		}
		var s = ar.join("");
		if(!capitalizeIntial) return s;
		// Capitalize the first letter of each word
		var ret = "";
		var after_space = true;
		var sokuon = false;
		var i = 0;
		while(i < s.length){
			var c = s.charCodeAt(i);
			if(c >= 97 && c <= 122){
				if(after_space){
					ret += u(c - 32);
					after_space = false;
				}else{
					ret += s.charAt(i);
				}
			}else{
				if(s.charAt(i) == "%"){
					var i2 = i + 1;
					while(i2 < s.length){
						if(s.charAt(i2) == "%"){
							break;
						}
						i2++;
					}
					ret += s.substring(i + 1, i2);
					i = i2 + 1;
					continue;
				}
				ret += s.charAt(i);
				after_space = true;
			}
			//trace(ret);
			i++;
		}
		return ret;
	}
	
	public static function hira2phonArray(hira:String, ?shorten:Bool = true){
		//trace("hira2phon is called!");
		var ret = [];
		var i = 0;
		while(i < hira.length){
			var c = getC(hira, i);
			if(c < 1 || c > 0x53 ){
				switch(hira.charAt(i)){
					case " ": ret.push(" ");
					case "　": ret.push(" ");
					case "'": ret.push(""); // apostrophe (for separating 'oo' or 'ou')
					case "%":  // cancel parse until the next % or the end of the string
						var i2 = i + 1;
						while(i2 < hira.length){
							if(hira.charAt(i2) == "%"){
								break;
							}
							i2++;
						}
						//trace("i: " + i + ", i2: "+ i2 + ", hira.length: " + hira.length);
						ret.push(hira.substring(i, i2));
						i = i2;
					case "ー": ret.push("#-");
					default: ret.push("?");
				}
			}else{
				if(i < hira.length - 1){
					var c2 = getC(hira, i + 1);
					// 'i' dan?
					var idx = idan.indexOf(uniKana[c]);
					if(idx > 0){
						// Check whether the next char is small kana
						switch(uniKana[c2]){
							case "@ya" : ret.push(phonKana[idx * 9 + 5]); i += 2;
							case "@yu" : ret.push(phonKana[idx * 9 + 6]); i += 2;
							case "@e" : ret.push(phonKana[idx * 9 + 7]); i += 2;
							case "@yo" : ret.push(phonKana[idx * 9 + 8]); i += 2;
							default: ret.push(uniKana[c]); i++;
						}
						continue;
					}
					// add code here to check other combination like フュ
				}
				// 'ou' or 'oo'?
				if(shorten && ret.length > 0 && (uniKana[c] == "o" || uniKana[c] == "u") ){
					var s = ret[ret.length - 1];
					if(s.charAt(s.length - 1) == "o"){
						i++;
						continue;
					}
				}
				ret.push(uniKana[c]);
			}
			i++;
		}
		//trace(ret);
		
		return ret;
	}
	
}
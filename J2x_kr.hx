/*
J2X -- Transliterate Japanese words in kana(hiragana or katakana) into other writing systems
------------------------------
Korean
------------------------------
Script: Hangul characters
Language: Korean

*/

@:expose
@:keep
class J2x_kr extends J2x_lang{
	 // Counterpart of phonKana in J2x_lang
	static var krKana = [
		"아", "이", "우", "에", "오", "야", "유", "예", "요",
		"카", "키", "쿠", "케", "코", "캬", "큐", "켸", "쿄",
		"가", "기", "구", "게", "고", "갸", "규", "계", "교",
		"사", "시", "수", "세", "소", "샤", "슈", "셰", "쇼",
		"샤", "시", "슈", "셰", "쇼", "샤", "슈", "셰", "쇼",
		"자", "지", "주", "제", "조", "쟈", "쥬", "졔", "죠",
		"자", "지", "주", "제", "조", "쟈", "쥬", "졔", "죠",
		"타", "티", "투", "테", "토", "차", "추", "체", "초",
		"차", "치", "추", "체", "초", "챠", "츄", "쳬", "쵸",
		"싸", "씨", "쑤", "쎄", "쏘", "쌰", "쓔", "쎼", "쑈",
		"다", "디", "두", "데", "도", "댜", "듀", "뎨", "됴",
		"나", "니", "누", "네", "노", "냐", "뉴", "녜", "뇨",
		"하", "히", "후", "헤", "호", "햐", "휴", "혜", "효",
		"화", "휘", "후", "훼", "훠", "햐", "휴", "혜", "효",
		"바", "비", "부", "베", "보", "뱌", "뷰", "볘", "뵤",
		"바", "비", "부", "베", "보", "뱌", "뷰", "볘", "뵤",
		"파", "피", "푸", "페", "포", "퍄", "퓨", "폐", "표",
		"마", "미", "무", "메", "모", "먀", "뮤", "몌", "묘",
		"야", "야", "웨", "예", "왜", "야", "유", "예", "요",
		"라", "리", "루", "레", "로", "랴", "류", "례", "료",
		"와", "위", "우", "웨", "워", "위", "우", "웨", "워",
		"ㄴ", "콰", "퀴", "퀘", "쿼", "과", "귀", "궤", "궈"
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
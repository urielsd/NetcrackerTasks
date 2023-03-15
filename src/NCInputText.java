import java.util.ArrayList;
import java.util.List;

public class NCInputText {

    String text;
    List<String> textArray;

    public NCInputText() {
        text="";
        textArray=new ArrayList<String>();
    }

    public NCInputText(String text) {
        this.text = text;
        textArray=new ArrayList<String>();
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<String> getTextArray() {
        return textArray;
    }

    public void setTextArray(List<String> textArray) {
        this.textArray = textArray;
    }

    public String processStringsByChars(){

        int index, charCount, startOfWord, endOfWord;
        index = charCount = startOfWord = 0;
        String result="";

        while (index < text.length())
        {

            if (charCount >= 50 || index == text.length() - 1 )
                if(text.charAt(index) == ' ' || index == (text.length()-1) )
                {
                    endOfWord = index;
                    textArray.add(text.substring(startOfWord, endOfWord));
                    textArray.add("\n");
                    charCount=0;
                    startOfWord = index+1;
                }
            charCount++;
            index ++;
        }

        for (int i=0; i< textArray.size(); i++)
            result += textArray.get(i);

        return result;
    }


}

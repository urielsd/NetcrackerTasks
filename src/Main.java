import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        System.out.print("Please, introduce text to process: ");

        Scanner scanner = new Scanner(System.in);
        String userInput = scanner.nextLine();

        NCInputText ncInput = new NCInputText(userInput);

        System.out.println("The resulting text is:");
        System.out.print(ncInput.processStringsByChars());
    }

}
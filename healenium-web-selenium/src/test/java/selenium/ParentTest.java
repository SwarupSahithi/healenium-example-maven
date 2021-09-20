package selenium;

import io.qameta.allure.Description;
import org.junit.jupiter.api.Test;
import selenium.pages.MainPage;

public class ParentTest extends BaseTest {

    @Test
    @Description("With findElement")
    public void testParentFindElement(){
        MainPage mainPage=new MainPage(driver);

        //  generate markup button click
        mainPage.open()
                .generateMarkup();

        //  finding page contain checkboxes
        while(!mainPage.displayedText())
            mainPage.generateMarkup();

        //  find checkboxes with findElement and click on them 10 times
        //  on page can be 4 or 8 checkboxes. when clicking on them healing should be healed
        for (int i=0; i<10; i++){
            mainPage.selectFirstCheckbox();
        }
    }

    @Test
    @Description("With findElementS")
    public void testParentFindElements(){
        MainPage mainPage=new MainPage(driver);

        //  generate markup button click
        mainPage.open()
                .generateMarkup();

        //  finding page contain checkboxes
        while(!mainPage.displayedText())
            mainPage.generateMarkup();

        //  find checkboxes with findElements and click on them. locators should be changed
        mainPage.selectAllCheckboxes();

        //  verify all checkboxes enabled with findElements. locators should be healed
        mainPage.verifyAllCheckboxes();
    }
}

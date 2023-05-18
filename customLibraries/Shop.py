import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        # importing library to Python file in order to be able use keywords
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    # method name will be converted to keyword name     Hello World
    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self,productsList):
        # ${elements} =    Get Webelements     //h4[@class='card-title']/a
        productsTitles = self.selLib.get_webelements("//h4[@class='card-title']/a")

        # ${index} = Set  Variable   1
        index = 1

        # FOR     ${element}  IN      @{elements}
        #       Exit For Loop If    '${cardName}' == '${element.text}'
        #       ${index} =  Evaluate    ${index} + 1
        # END
        for productTitle in productsTitles:
            if productTitle.text in productsList:
                #Click Button( //div[@class ='card-footer'])[${index}]/button
                self.selLib.click_button("(//div[@class='card-footer'])["+str(index)+"]/button")
            index = index + 1

        self.selLib.click_link("//li[@class='nav-item active']/a")
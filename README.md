# Instructions #

The purpose of this assignment is to see how would you develop code in both iOS and Android platforms. Do not focus too much on aesthetics (they need an important time investment and this is not the purpose of the assignment), but do on layout. It's important that the UI components adapt properly to different screen sizes. The provided mockups indicate the desired layout but just in an orientative manner, don't spend too much time trying to make the apps look exactly the same.

Regarding the code you must develop, do it like it was to be on production. Follow your own coding conventions but make it coherent through all the code you develop. Write clean, maintainable, quality code using all the components you need.

### Assignment 1 ###

Let's build a very simple app consisting of the following two screens:

![Captura de pantalla 2016-02-27 a las 11.32.43.png](https://bitbucket.org/repo/6Gqb5q/images/673336005-Captura%20de%20pantalla%202016-02-27%20a%20las%2011.32.43.png)

￼￼In the first one the user must enter a text in the text input in order to the submit button to work. If text is empty, clicking the submit button must show a simple alert. If the text is not empty, the second screen must be shown.

The second screen must show the text entered in the text input within a label at the top. At the bottom of the screen the current time must be shown in the format dd/MM/yyyy HH:mm:ss.SSS. The date must update in a < 1 second frequency (so we can see the current date including the milliseconds).

### Assignment 2 ###

Let's build a scrollable grid view that looks similar to this:

![Captura de pantalla 2016-02-27 a las 11.33.12.png](https://bitbucket.org/repo/6Gqb5q/images/828760594-Captura%20de%20pantalla%202016-02-27%20a%20las%2011.33.12.png)

￼Each element in the grid must be an image obtained through the following URL: https://www.nicequest.com/portal_nicequest_api/DocumentServlet?docid=[[DOC_ID]​] We'll provide a list of 1000 valid DOC_IDs so you can use them in the app.

The scroll bar must not be shown, it's just there to point out that the view must be scrollable.

Make the scrolling smooth and limit the use of memory (an infinite scroll should not crash the app). It also shouldn't take long for the images to be displayed.
/*
 * DeliciousApp.fx
 *
 * Created on 29/01/2010, 12:23:05
 */
package movieinfofx;

import javafx.io.http.HttpRequest;
import javafx.data.pull.PullParser;
import java.io.InputStream;
import javafx.data.pull.Event;

/**
 * @author william.siqueira
 */
public class DeliciousApp {

    var request: HttpRequest;
    var parser: PullParser;

    public function myRecentBookMarks(username:String, password:String): Void {
        request =
        HttpRequest {
            method: HttpRequest.GET;
            location:"api.del.icio.us/v1/posts/recent";
            onError:null;
            onInput: function (input: InputStream) {
                parser = PullParser {
                    documentType: PullParser.XML;
                    onEvent: function (event: Event) {
                        if (event.type == PullParser.END_ELEMENT) {
                            println("Description = {event.getAttributeValue("description")}");
                            println("Description = {event.getAttributeValue("href")}");
                        }
                    }
                }
            }
        }
    }
}



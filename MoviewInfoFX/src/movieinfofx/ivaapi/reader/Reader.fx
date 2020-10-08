/*
 * Reader.fx
 *
 * Created on 30/01/2010, 13:59:16
 */
package movieinfofx.ivaapi.reader;

import javafx.data.pull.Event;
import movieinfofx.ivaapi.IvaApiReader;
import javafx.stage.Alert;
import javafx.data.pull.PullParser;

/**
I think that this is necessary.

I think that we need to standardize the reader operations and
change the reader dinamically when using all the readers
 */
public mixin class Reader {
    /*
    If you are reading, this var will be true, the implementation need to take
    care this status
     */

    public var busy: Boolean;
    protected var what: String;

    /*
    The function that is called when the API result have some error
     */
    public var errorFunction: function(e:String) = defaultErrorHandler;
    /*
    The reader
     */
    public var reader: IvaApiReader;
    public def readerStatus: String = bind reader.status on replace {
                searchingStatus = readerStatus;
            }
    public var searchingStatus: String;

    public function defaultErrorHandler(e: String) {
        Alert.inform("Something unusual happened: \n {e}");
    };

    public function read(value: String, method: String) {
        reader.read(what, method, value, "1", parsingInternal);
    }

    public function parsingInternal(event: Event): Void {
        if (event.type == PullParser.START_ELEMENT)
            searchingStatus = "Parser -> Starting new Element...";

        if (event.type == PullParser.END_ELEMENT)
            if (event.qname.name == "Error") {
                errorFunction(event.text);
                searchingStatus = "Parser -> Error!!!!";
            }

        if (event.type == PullParser.START_DOCUMENT) {
            busy = true;
            searchingStatus = "Parser -> Start parsing...";
        } else if (event.type == PullParser.END_DOCUMENT) {
            busy = false;
            searchingStatus = "Parser -> End parsing!";
        }
        parsing(event);

    }

    public abstract function parsing(event: Event): Void;
}

/*
 * IvaApiReader.fx
 *
 * Created on 25/01/2010, 22:49:29
 */

package movieinfofx.ivaapi;

import javafx.io.http.HttpRequest;
import java.io.InputStream;
import javafx.data.pull.PullParser;
import javafx.data.pull.Event;
import java.net.URLEncoder;
import java.lang.Exception;

/**
 * @author Administrador

 IVA stands for Internet Video Archive

 About the API:
 The API is simple to use, is REST based. You just need to send you Developer ID and the
 term to search, acessing the right URL.

 About the URL:

 http://api.internetvideoarchive.com/{1}/{2}.aspx?DeveloperId={3}&SearchTerm={4}

 Where:

 1 - What you search: Video, Music or game

 2 - Search method. This depends of what you searh(video, game, music).
    Examples: TitleSearch, NewOnTv(video), SearhByArtistId(music)

 3 - The developer ID that you can get in api documentation site:
 http://api.internetvideoarchive.com/Documentation.aspx

 4 - The term to search. Sometimes this term need to be parametrized. Example, in movie category:

VideoCategoryId	VideoCategory
1	Not Assigned
0	Western
1	Action-Adventure
2	Children's
3	Comedy
4	Drama
5	Family
6	Horror
7	Musical
8	Mystery-Suspense
9	Non-Fiction
10	Sci-Fi
11	War
12	Health/ Workout
13	Documentary
14	Thriller
15	Biography
16	Romance

A example of a monted URL
http://api.internetvideoarchive.com/Video/TitleSearch.aspx?DeveloperId={Your+ID}&SearchTerm=Jaws

Our access class:

The Idea here is parametrize the acessed method

 Example:

  var musicReader = IvaApiReader{
    media: IvaApiReader.MUSIC;
    developerID: "ID";
}

  So, we can call the method to read data just doing it:

 musicReader.read(IvaApiReader.ByTitle, "We are the champions",
 function);
 In another words, this class make the low level of the API access.
 Easy ;)
 */

public class IvaApiReader {       
    public var status:String;    
    public-init var developerKey:String;
    def URL = "http://api.internetvideoarchive.com";

    var parser:PullParser;
    var request:HttpRequest;

    init{
        parser = PullParser {
            documentType: PullParser.XML;
        }
    }

    public function read(what:String, method:String, value:String, page:String,onEvent: function(event: Event)):Void{
        
        var url = mountUrl(what, method, page, value);
        println(url);
        request = HttpRequest{
            location:url;
            method: HttpRequest.GET;

            onStarted: function() {  status = "Request->Started..."; }
            onConnecting: function() { status = "Request->Connecting...";}
            onDoneConnect: function() { status = "Request->Done Connect";}
            onReadingHeaders: function() { status = "Request->Reading Headers";}
            onResponseCode: function(code:Integer) { status = "Request->ResponseCode: {code}"; }
            onReading: function() { status = "Request->Reading...";}
            onDone:function(){status = "Request->Done!";}
            onResponseMessage: function(msg:String) { status = "Request->ResponseMessage: {msg}"; }
            onInput: function(inResponse: InputStream){
                 parser.input = inResponse;
                 parser.onEvent = onEvent;
                 parser.parse();
                 try{
                    parser.input.close();
                 }catch(e:Exception){
                    status = "Request->Error when closing stream...";
                 }
               }
        };
        request.start();        
    }

    function mountUrl(what:String, method:String,page:String, value:String):String{
        var urlOut = "{URL}/{what}/{method}.aspx?DeveloperId={developerKey}&Page={page}&PageSize=50";

        if(value != null){
            urlOut += "&SearchTerm={URLEncoder.encode(value, "UTF-8")}";
        }
        return urlOut;
     }
}
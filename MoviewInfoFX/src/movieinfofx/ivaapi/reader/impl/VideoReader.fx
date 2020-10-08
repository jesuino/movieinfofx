/*
 * VideoReader.fx
 *
 * Created on 30/01/2010, 14:01:33
 */
package movieinfofx.ivaapi.reader.impl;

import movieinfofx.ivaapi.model.Video;
import movieinfofx.ivaapi.reader.Reader;
import movieinfofx.ivaapi.IvaApiReader;
import javafx.data.pull.Event;
import javafx.data.pull.PullParser;

/**
 * @author Administrador
 */
public class VideoReader extends Reader {

    override public-read var busy;
    override var what = "Video";
    var videos: Video[];
    var tempVideo: Video;
    var callbackFunction: function( data


           :


      Video [])


                   ;













































init{
        reader = IvaApiReader{
            developerKey: "0e333212-6df2-4ee3-abca-740fdc7384b0";
        }
    }

    override public function parsing (event : Event) : Void {
        if(event.type == PullParser.START_ELEMENT){
            //new video
            if (event.qname.name == "item") tempVideo = Video{}
        }
        if (event.type == PullParser.END_ELEMENT) {
            //Here we take what we want, is easy!
            if(event.qname.name == "Title") tempVideo.title = event.text;
            if(event.qname.name == "Description") tempVideo.description = event.text;
            if(event.qname.name == "DateCreated") tempVideo.dateCreated = event.text;
            if(event.qname.name == "Director") tempVideo.director = event.text;
            if(event.qname.name == "Genre") tempVideo.genre = event.text;
            if(event.qname.name == "Image") tempVideo.image = event.text;
            if(event.qname.name == "Country") tempVideo.country = event.text;
            if(event.qname.name == "EmbedUrl") tempVideo.webUrl = event.text;
            for(i in [1..6])
                if(event.qname.name == "Actor{i}")
                    if(event.text !="")
                        insert event.text into tempVideo.actors;
            if(event.qname.name == "item"){
               insert tempVideo into videos;
            }

          }else if (event.type == PullParser.END_DOCUMENT){            
             callbackFunction(videos);
         }
    }


/*
This is the point, we will use the callback function, when the parse over, and
we get all result in objects, we call this function, like we do with JQuery!
*/
    public function byTitle(value:String, callback:function(data:Video[])):Void{
        this.callbackFunction = callback;
        videos = [];
        read(value, "TitleSearch");        
    }


    public function byGenre(value:String, callback:function(data:Video[])):Void{
        this.callbackFunction = callback;
        videos = [];
        read(value, "MoviesByGenreID");
    }

        public function popularDvd(callback:function(data:Video[])):Void{
        this.callbackFunction = callback;
        videos = [];
        read(null, "PopularDVD");
    }
}

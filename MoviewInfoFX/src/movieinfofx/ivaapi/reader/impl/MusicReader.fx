/*
 * MusicReader.fx
 *
 * Created on 30/01/2010, 19:09:26
 */

package movieinfofx.ivaapi.reader.impl;

import movieinfofx.ivaapi.reader.Reader;
import movieinfofx.ivaapi.IvaApiReader;
import javafx.data.pull.Event;
import movieinfofx.ivaapi.model.Music;
import javafx.data.pull.PullParser;


/**
 * @author Administrador
 */

public class MusicReader extends Reader{

    override public-read var busy;
    var musics:Music[];
    var tempMusic:Music;
    override  var what = "Music";
    var callbackFunction:function(data:Music[]);

    init{
        reader = IvaApiReader{
            developerKey: "0e333212-6df2-4ee3-abca-740fdc7384b0";
        }
    }

    override public function parsing (event : Event) : Void {        
        if(event.type == PullParser.START_ELEMENT){
            //new video
            if (event.qname.name == "item") tempMusic = Music{};
        }
        if (event.type == PullParser.END_ELEMENT) {
            //Here we take what we want, is easy!
            if(event.qname.name == "Description") tempMusic.description = event.text;
            if(event.qname.name == "Title") tempMusic.title = event.text;
            if(event.qname.name == "Language") tempMusic.language = event.text;
            if(event.qname.name == "Country") tempMusic.country = event.text;
            if(event.qname.name == "SiteUrl") tempMusic.siteUrl = event.text;
            if(event.qname.name == "Label") tempMusic.label = event.text;
            if(event.qname.name == "Genre") tempMusic.genre = event.text;
            if(event.qname.name == "Image") tempMusic.image = event.text;
            if(event.qname.name == "Duration") tempMusic.duration = event.text;
            if(event.qname.name == "EmbedUrl") tempMusic.webUrl = event.text;
            if(event.qname.name == "DateCreated") tempMusic.dateCreated = event.text;            
            for(i in [1..6])
                if(event.qname.name == "Artist{i}")
                    if(event.text !="")
                        insert event.text into tempMusic.artist;
            if(event.qname.name == "item"){
                 insert tempMusic into musics;
            }

          }else if (event.type == PullParser.END_DOCUMENT){
             // we set busy to false and call the callback function
             busy = false;
            callbackFunction(musics);
         }
    }

    public function byTitle(value:String, callback:function(data:Music[])):Void{
        this.callbackFunction = callback;
        musics = [];
        read(value, "TitleSearch");

    }
    public function byGenre(value:String, callback:function(data:Music[])):Void{
        this.callbackFunction = callback;
        musics = [];
        read(value, "SearchByGenreID");
    }
}

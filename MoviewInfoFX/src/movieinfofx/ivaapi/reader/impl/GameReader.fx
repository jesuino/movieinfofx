/*
 * GameReader.fx
 *
 * Created on 31/01/2010, 12:47:50
 */
package movieinfofx.ivaapi.reader.impl;

import movieinfofx.ivaapi.IvaApiReader;
import movieinfofx.ivaapi.reader.Reader;
import movieinfofx.ivaapi.model.Game;
import javafx.data.pull.Event;
import javafx.data.pull.PullParser;

public class GameReader extends Reader {

    var games: Game[];
    var tempGame: Game;
    override var what = "Game";
    var callbackFunction: function( data


           :


      Game [])


                   ;
















































init{
        reader = IvaApiReader{
            developerKey:"0e333212-6df2-4ee3-abca-740fdc7384b0";
        }
    }

    override public function parsing (event : Event) : Void {
        if(event.type == PullParser.START_ELEMENT){
            //new video
            if (event.qname.name == "item") tempGame = Game{}
        }
        if (event.type == PullParser.END_ELEMENT) {
            //Here we take what we want, is easy!
            if(event.qname.name == "Title") tempGame.title = event.text;
            if(event.qname.name == "Description") tempGame.description = event.text;
            if(event.qname.name == "DateCreated") tempGame.dateCreated = event.text;
            if(event.qname.name == "Genre") tempGame.genre = event.text;
            if(event.qname.name == "Language") tempGame.language = event.text;
            if(event.qname.name == "Image") tempGame.image = event.text;
            if(event.qname.name == "Country") tempGame.country = event.text;
            if(event.qname.name == "EmbedUrl") tempGame.webUrl = event.text;
            if(event.qname.name == "ReleasedYear") tempGame.year = event.text;
            if(event.qname.name == "gameformat") insert event.text into tempGame.gameFormat;            

            if(event.qname.name == "item"){
               insert tempGame into games;
            }

          }else if (event.type == PullParser.END_DOCUMENT){             
             callbackFunction(games);
         }
    }
    public function byTitle(value:String, callback:function(data:Game[])){
        this.callbackFunction = callback;
        games = [];
        read(value, "TitleSearch");
    }

    public function byGenre(value:String, callback:function(data:Game[])):Void{
        this.callbackFunction = callback;
        games = [];
        read(value, "SearchByGenreId");
    }

}

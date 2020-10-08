/*
 * VideoDetailsPanel.fx
 *
 * Created on 06/02/2010, 17:39:53
 */

package movieinfofx.view.panels.impl.video;

import movieinfofx.view.panels.DetailsPanel;
import movieinfofx.ivaapi.model.Video;
import javafx.scene.Node;
import movieinfofx.view.panels.OtherInfoPanel;

/**
 * @author william
 */

public class VideoDetailsPanel extends DetailsPanel{
    var video:Video = bind object as Video;

    override public function moreDetails () : Node[] {
        [
            OtherInfoPanel{info: "Actors", value: bind {
                    var value = "{for( f in video.actors) "{f}, "}";
                    if(value.length() > 0){
                        value.substring(0, value.length() - 2);
                     }else " -";
                }},
            OtherInfoPanel{info: "Director", value: video.director}
        ]
    }

    override public function configValues () : Void {

    }


}

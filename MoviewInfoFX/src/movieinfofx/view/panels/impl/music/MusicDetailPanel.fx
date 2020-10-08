/*
 * MusicDetailPanel.fx
 *
 * Created on 07/02/2010, 16:25:05
 */
package movieinfofx.view.panels.impl.music;

import movieinfofx.view.panels.DetailsPanel;
import javafx.scene.Node;
import movieinfofx.ivaapi.model.Music;
import movieinfofx.view.panels.OtherInfoPanel;

/**
 * @author william
 */
public class MusicDetailPanel extends DetailsPanel {

    var music: Music = bind object as Music;

    override public function configValues(): Void {
    }

    override public function moreDetails(): Node[] {
        [
            OtherInfoPanel {info: "Artists", value: bind {
                    var value = "{for( m in music.artist) "{m}, "}";
                    if (value.length() > 0) {
                        value.substring(0, value.length() - 2);
                    } else " -";
                }},
            OtherInfoPanel {info: "Duration" value: bind music.duration}
            OtherInfoPanel {info: "Label" value: bind music.label}
        ]
    }
}

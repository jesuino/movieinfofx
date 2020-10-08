/*
 * GameDetailsPanel.fx
 *
 * Created on 02/02/2010, 19:06:02
 */
package movieinfofx.view.panels.impl.game;

import movieinfofx.ivaapi.model.Game;
import movieinfofx.view.panels.DetailsPanel;
import javafx.scene.Node;
import movieinfofx.view.panels.OtherInfoPanel;

/**
 * @author william
 */
public class GameDetailsPanel extends DetailsPanel {

    var game: Game = bind object as Game;

    override public function configValues(): Void {

    }

    override public function moreDetails(): Node[] {
        [
            OtherInfoPanel {info: "Platforms", value: bind {
                    var value = "{for( f in game.gameFormat) "{f}, "}";
                    if(value.length() > 0){
                        value.substring(0, value.length() - 2);
                     }else " -";
                }}
        ]
    }
}

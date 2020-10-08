/*
 * Main.fx
 *
 * Created on 25/01/2010, 22:44:39
 */
package movieinfofx;

import javafx.stage.Stage;
import movieinfofx.view.panels.impl.video.VideoMainPanel;
import movieinfofx.view.panels.impl.game.GameMainPanel;
import movieinfofx.view.panels.impl.music.MusicMainPanel;
import movieinfofx.view.components.OnlyOnePanel;
import movieinfofx.view.Welcome;
import javafx.scene.paint.Color;
import javafx.scene.Scene;


var videoPanel: VideoMainPanel =
        VideoMainPanel {
            panelStyle: "base: green; background: yellow";
            width: 900;
        };
var gamePanel: GameMainPanel =
        GameMainPanel {
            panelStyle: "base: red; background: gray";
            width: 900;
        };
var musicPanel: MusicMainPanel = MusicMainPanel {
            panelStyle: "base: black; background: orange";
            width: 900;
        };
var onlyOne: OnlyOnePanel = OnlyOnePanel {translateX: 15; translateY: 15;};

onlyOne.add("About", Welcome {});
onlyOne.add("Video", videoPanel);
onlyOne.add("Music", musicPanel);
onlyOne.add("Game", gamePanel);

Stage {
    x: 50 y: 50;
    width: 1200; height: 1000;
    scene: Scene {
        fill: Color.LIGHTGRAY
        content: [onlyOne]
    };
}

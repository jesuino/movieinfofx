/*
 * GameSearchResultsPanel.fx
 *
 * Created on 04/02/2010, 15:02:50
 */
package movieinfofx.view.panels.impl.game;

import movieinfofx.view.panels.SearchResultsPanel;
import movieinfofx.ivaapi.model.Game;

/**
 * @author william.siqueira
 */
public class GameSearchResultsPanel extends SearchResultsPanel {

    public var games: Game[];
    override var objects = bind games;
    override var details = bind GameDetailsPanel {
                panelStyle: bind panelStyle;
                visible: bind sizeof listView.items > 0;
                object: bind games[listView.selectedIndex]
            };
}

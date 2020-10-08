/*
 * IVAObject.fx
 *
 * Created on 04/02/2010, 03:24:47
 */
package movieinfofx.ivaapi.model;

import org.jfxtras.scene.image.XImage;
import movieinfofx.util.Global;

/**
 * @author william
 */
public abstract class IVAObject {

    public var title: String;
    public var description: String;
    public var genre: String;
    public var dateCreated: String;
    public var language: String;
    public var country: String;
    public var webUrl: String;

    public function loadImage() {
        if (img == null)
            img = XImage {
                backgroundLoading: true
                url: image
                smooth: false;
                width: 100 height: 100
                placeholder: Global.loadingImage;
            }        
    }

    /*
    This will avoid multiple Image Load....
     */
    public var image: String;
    public-read var img: XImage;
}

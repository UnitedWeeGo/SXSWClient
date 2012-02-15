package components.carousel
{
import spark.components.supportClasses.ItemRenderer;

public class BackgroundColorRenderer extends ItemRenderer
{
    public function BackgroundColorRenderer()
    {
        super();
    }
    
    override public function set data(value:Object):void
    {
        super.data = value;
        
        invalidateDisplayList();
    }
    
    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.updateDisplayList(unscaledWidth, unscaledHeight);
        
        graphics.clear();
        graphics.beginFill(data as Number);
        graphics.drawRect(0, 0, unscaledWidth/2, unscaledHeight/2);
        graphics.endFill();
    }
}
}
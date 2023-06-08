class Platform{
    float x;
    float y;
    float width;
    float height;

    Platform(float x, float y, float width, float height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    void drawPlatform(){
        fill(100,100,100);
        rect(x, y, width, height);
    }
}
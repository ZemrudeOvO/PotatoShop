PFont font;
brush normalRoundBrush;
int bgColor = 200;
int firstPaint = 0;
float mouseScroll;
int StrokeWeight = 10;
int R = 250;
int G = 50;
int B = 100;
int mousePressedCount = 0;

int savedFileName = 0;

class brush {
    int brushStrokeWeight;
    int brushColorRed;
    int brushColorGreen;
    int brushColorBlue;

    brush(int StrokeWeight, int StrokeColor) {
        brushStrokeWeight = StrokeWeight;
        brushColorRed = StrokeColor;
        brushColorGreen = StrokeColor;
        brushColorBlue = StrokeColor;
    }

    brush(int Weight, int r, int g, int b) {
       brushStrokeWeight = Weight; 
       brushColorRed = r;
       brushColorGreen = g;
       brushColorBlue = b;
    }

    void init_Stroke() {
        stroke(brushColorRed, brushColorGreen, brushColorBlue);
        strokeWeight(brushStrokeWeight);
    }
}

void settings() {
    size(1280, 720);
}

void setup() {
    init_Canvas();
    help();
}

void draw() {
    cursor(ARROW);
    normalRoundBrush = new brush(StrokeWeight, R, G, B);
    checkForFirstDraw();
}

void init_Canvas() {
    background(bgColor);
    fill(0);
    font = loadFont("Source.vlw");
    textFont(font);
}

void keyPressed() {
    if (key == 'f') {
        background(bgColor);
    }

    if (key == 's') {
        save(str(savedFileName) + ".jpg");
        savedFileName++;
    }

    if (key == 'h') {
        help();
    }
}

void mouseDragged() {
    if (mouseButton == LEFT) {
        mousePressedCount++;
        cursor(CROSS);
        normalRoundBrush.init_Stroke();
        line(pmouseX, pmouseY, mouseX, mouseY);
    }
}

void mouseWheel(MouseEvent event) {
    mouseScroll = event.getCount();
    StrokeWeight -= mouseScroll;
    if (StrokeWeight <= 0) {
        StrokeWeight = 1;
    }
    println("mouseScroll = " + mouseScroll);
    println(StrokeWeight);
}

void help() {
    text("press 'h' to HELP", 0, 100);
    text("press 'f' to CLEEN", 0, 200);
    text("press 's' to SAVE", 0, 300);
    text("drag mouse to draw", 0, 400);
    text("scroll mouse to change the brush size", 0, 500);
}

void checkForFirstDraw() {
    if (mousePressedCount >= 1 && mousePressedCount <= 3) {
        background(bgColor);
    } 
}

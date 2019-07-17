import controlP5.*;


PFont andes;
PFont smallFont;

ControlP5 cp5;

// Where the words to scramble will be saved
String adjective;
String method;
String user;
String state;

// Data taken from the .csv sheet
StringList methodList;
StringList userList;
StringList adjectiveList;
StringList stateList;

Table table;

//Randomized values to call the words from the StringLists
int adjectivegen=1;
int methodgen=1;
int usergen=1;
int stategen=1;

color background= color(180, 150, 200);

//Variables for the interface sliders and button states
int User;
int Method;
int Adjective;
int State;

boolean userRando=true;
boolean methodRando=true;
boolean adjectiveRando=true;
boolean stateRando=true;

int timerValue;
Knob timerDisplay;

boolean Pause=true;
PrintWriter output;



void setup() {

  andes = loadFont("Andes-ExtraBold-48.vlw");
  smallFont = createFont("Arial", 12);
  cp5 = new ControlP5(this);

  size(1200, 800);
  background(background);

  //Load the .csv strings  
  table = loadTable("CTIdata.csv", "header");

  methodList = new StringList();
  adjectiveList = new StringList();
  userList = new StringList();
  stateList = new StringList();

  //load the strings into the StringLists
  newConcept();
  UI();
}


void draw() {
  background(background);
  textAlign(CENTER);
  textFont(andes);
  generator();
  fill(255);
  noStroke();

  //Display the concept with the latest chosen words
  text(adjective +" "+ method + " to help " + user + " " + state + ".", width/2-500, height/2-100, 1000, 400);



  //Display instructions
  textAlign(LEFT);
  textFont(smallFont);
  if (mouseY>height-200) {
    text("Use the controls bellow to create new concepts. You can use the sliders to choose a specific item from the list or press the square next to them to have an item randomly selected.", 50, height-160, 500, 150);
  }

  UIupdates();

  //New Concept timer
  if (trigger==true) {
    randomizer();
    background= color(random(180, 200), random(180, 200), random(180, 200));
  }
  timer();
}


//Load the strings into the StringLists
void newConcept() {
  for (TableRow row : table.rows ()) {

    methodList.append(row.getString(1));
    if (methodList.hasValue("") == true) {
      methodList.remove(methodList.size()-1);
    }

    userList.append(row.getString(2));
    if (userList.hasValue("") == true) {
      userList.remove(userList.size()-1);
    }

    stateList.append(row.getString(3));
    if (stateList.hasValue("") == true) {
      stateList.remove(stateList.size()-1);
    }

    adjectiveList.append(row.getString(0));
    if (adjectiveList.hasValue("") == true) {
      adjectiveList.remove(adjectiveList.size()-1);
    }
  }
}

//Generate values used to select a concept
void randomizer() {
  adjectivegen = int(random(0, adjectiveList.size()));
  methodgen = int(random(0, methodList.size()));
  usergen = int(random(0, userList.size()));
  stategen = int(random(0, stateList.size()));
}


//Generate the concept by pairing the generator values and the StringLists
void generator() {  
  if (adjectiveRando == true) {
    adjective = adjectiveList.get(adjectivegen);
    cp5.getController("Adjective").setValue(0);
  } else {  
    adjective = adjectiveList.get(Adjective);
  }

  if (userRando == true) {
    user = userList.get(usergen);
    cp5.getController("User").setValue(0);
  } else {  
    user = userList.get(User);
  }

  if (methodRando == true) {
    method = methodList.get(methodgen);
    cp5.getController("Method").setValue(0);
  } else {  
    method = methodList.get(Method);
  }

  if (stateRando == true) {
    state = stateList.get(stategen);
    cp5.getController("State").setValue(0);
  } else {  
    state = stateList.get(State);
  }
}

//Press any key to download the full range permutations possible
void keyPressed() {
  download();
}

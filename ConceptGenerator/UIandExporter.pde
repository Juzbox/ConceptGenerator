int mainCounter=0;
int adjCounter;
int userCounter;
int stateCounter;
int methodCounter;

//UI Elements
void UI() {
  cp5.addSlider("User")
    .setPosition(355, height-100)
    .setSize(300, 20)
    .setRange(0, userList.size()-1)
    .setCaptionLabel("");

  cp5.addSlider("Method")
    .setPosition(120, height-70)
    .setSize(200, 20)
    .setRange(0, methodList.size()-1)
    .setCaptionLabel("");

  cp5.addSlider("Adjective")
    .setPosition(120, height-100)
    .setSize(200, 20)
    .setRange(0, adjectiveList.size()-1)
    .setCaptionLabel("");

  cp5.addSlider("State")
    .setPosition(355, height-70)
    .setSize(300, 20)
    .setRange(0, stateList.size()-1)
    .setCaptionLabel("");

  cp5.addToggle("userRando")
    .setPosition(660, height-100)
    .setSize(20, 20)
    .setCaptionLabel("");

  cp5.addToggle("methodRando")
    .setPosition(325, height-70)
    .setSize(20, 20)
    .setCaptionLabel("");

  cp5.addToggle("adjectiveRando")
    .setPosition(325, height-100)
    .setSize(20, 20)
    .setCaptionLabel("");

  cp5.addToggle("stateRando")
    .setPosition(660, height-70)
    .setSize(20, 20)
    .setCaptionLabel("");

  cp5.addKnob("knob")
    .setRange(0, timer*frameSpeed)
    .setStartAngle(-PI/2)
    .setValue(tempTimer)
    .setPosition(50, height-100)
    .setRadius(25)
    .setNumberOfTickMarks(0)
    .setAngleRange(TWO_PI)
    .setCaptionLabel("New Concept");

  cp5.addToggle("Pause")
    .setPosition(width-100, height-100)
    .setSize(50, 50)
    .setCaptionLabel("PAUSE");
}

//UI elements will check on and update each other
void UIupdates() {
  cp5.getController("User").setValueLabel(user);
  cp5.getController("Method").setValueLabel(method);
  cp5.getController("Adjective").setValueLabel(adjective);
  cp5.getController("State").setValueLabel(state);

  cp5.getController("knob").setValue(tempTimer);
  cp5.getController("knob").setValueLabel("");

  if (cp5.getController("User").isMousePressed()) {
    cp5.getController("userRando").setValue(0);
  }

  if (cp5.getController("Method").isMousePressed()) {
    cp5.getController("methodRando").setValue(0);
  }

  if (cp5.getController("Adjective").isMousePressed()) {
    cp5.getController("adjectiveRando").setValue(0);
  }

  if (cp5.getController("State").isMousePressed()) {
    cp5.getController("stateRando").setValue(0);
  }
}

//Press any key to export all the permutations into a text file
void download () {
  output = createWriter("allconcepts.txt");
  if (mainCounter==0) {
    for (int i=0; i<adjectiveList.size(); i++) {
      for (int j=0; j<methodList.size(); j++) {
        for (int k=0; k<userList.size(); k++) {
          for (int l=0; l<stateList.size(); l++) {
            output.println(adjectiveList.get(i) + " " + methodList.get(j) + " to help " + userList.get(k)+ " remain " + stateList.get(l) + ".");
          }
        }
      }
    }
  }
}
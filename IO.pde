interface KeyListener {
  public void keyPressed(int keyCode);
  public void keyReleased(int keyCode);
}

ArrayList<KeyListener> keyListeners = new ArrayList<KeyListener>();

void keyPressed() {
  for (KeyListener listener : keyListeners) {
    listener.keyPressed(keyCode);
  }
}

void keyReleased() {
  for (KeyListener listener : keyListeners) {
    listener.keyReleased(keyCode);
  }
}

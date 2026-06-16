{
  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      allow_images = true;

      width = 480;
      prompt = "Search";

      style = "

/* Colors and fonts */
#window {
    background-color: #272E33;
    border-radius: 24px;
    padding: 12px;
}

/* Mainbox padding */
#inner-box {
    padding: 12px;
}

/* Input bar */
#input {
    background-color: #2A2A2A;
    color: #E6E6E6;
    border-radius: 16px;
    border: 2px solid #0b6495;
    padding: 8px 16px;
    margin-bottom: 12px;
}

#input::placeholder {
    color: #3D3D3D;
}

/* Message box */
#message {
    background-color: #3D3D3D80;
    border-radius: 16px;
    border: 1px solid #3D3D3D80;
    color: #FFFFFF;
    margin-top: 12px;
    padding: 8px 24px;
}

/* Entry (list element) */
entry {
    padding: 8px 16px;
    border-radius: 16px;
    color: #E6E6E6;
    margin-bottom: 4px;
    transition: background-color 0.2s ease, color 0.2s ease;
}

/* Selected entry */
entry:selected {
    background-color: #0b6495;
    color: #FFFFFF;
}

/* Element icon */
#img {
    width: 1em;
    height: 1em;
    vertical-align: 0.5em;
    margin-right: 8px;
}

/* Text inside element */
#text {
    color: inherit;
}



";

};
};
}

module pogany.proba {
    requires javafx.controls;
    requires javafx.fxml;


    opens pogany.proba to javafx.fxml;
    exports pogany.proba;
}
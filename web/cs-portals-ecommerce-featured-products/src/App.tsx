import { IonApp, IonContent, IonPage, setupIonicReact } from "@ionic/react";
import FeaturedProducts from "./components/FeaturedProducts";

/* Core CSS required for Ionic components to work properly */
import "@ionic/react/css/core.css";

/* Basic CSS for apps built with Ionic */
import "@ionic/react/css/normalize.css";
import "@ionic/react/css/structure.css";
import "@ionic/react/css/typography.css";

/* Optional CSS utils that can be commented out */
import "@ionic/react/css/padding.css";
import "@ionic/react/css/float-elements.css";
import "@ionic/react/css/text-alignment.css";
import "@ionic/react/css/text-transformation.css";
import "@ionic/react/css/flex-utils.css";
import "@ionic/react/css/display.css";

/* Theme variables */
import "./theme/variables.css";

import { registerPlugin } from '@capacitor/core'

setupIonicReact();
type NavigationOptions = {
  id: number
}
interface NavigationPlugin {
  selectProduct(options: NavigationOptions): Promise<void>;
}

const Navigation = registerPlugin<NavigationPlugin>('Navigation', {
  web: { selectProduct: (id: number) => { alert(id)} },
})

function handleProductClick(id: number) {
  Navigation.selectProduct({id})
}

const App: React.FC = () => (
  <IonApp>
    <IonPage>
      <IonContent scrollY={false}>
        <FeaturedProducts onProductClick={handleProductClick} />
      </IonContent>
    </IonPage>
  </IonApp>
);

export default App;

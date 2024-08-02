import { IonCard, IonCardSubtitle, IonCardTitle } from "@ionic/react";
import { Product } from "../models";

import "./ProductCard.css";

interface ProductCardProps {
  product: Product;
  onProductClick: (id: number) => void
}

const formatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  maximumSignificantDigits: 2,
});

const ProductCard: React.FC<ProductCardProps> = ({ product, onProductClick }) => {
  const handleItemSelection = onProductClick

  return (
    <IonCard
      button={true}
      class="product-card"
      onClick={() => handleItemSelection(product.id)}
    >
      <img
        alt={product.title}
        src={require(`../assets/images/${product.image}`)}
      />
      <IonCardTitle>{product.title}</IonCardTitle>
      <IonCardSubtitle>{formatter.format(product.price)}</IonCardSubtitle>
    </IonCard>
  );
};
export default ProductCard;

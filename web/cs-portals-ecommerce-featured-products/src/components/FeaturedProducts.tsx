import { Product } from "../models";
import getFeaturedProducts from "../api/getFeaturedProducts";
import ProductCard from "./ProductCard";

import "./FeaturedProducts.css";

type FeaturedProductsProps = {
  onProductClick: (id: number) => void
}

const FeaturedProducts: React.FC<FeaturedProductsProps> = ({ onProductClick }) => {
  const handleProductClick = onProductClick

  return (
    <div className="featured-products">
      <h2>
        Must Haves, Bestsellers &amp; More
      </h2>
      <div className="product-list">
        <div className="product-list-inner">
          {getFeaturedProducts().map((product: Product) => (
            <ProductCard key={product.id} product={product} onProductClick={handleProductClick}/>
          ))}
        </div>
      </div>
    </div>
  );
};
export default FeaturedProducts;

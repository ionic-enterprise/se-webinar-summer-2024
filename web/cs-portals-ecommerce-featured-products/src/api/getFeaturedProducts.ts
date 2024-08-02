import { Product } from "../models";

const getFeaturedProducts = (): Product[] => {
  const res = require("../assets/data.json");
  const { products } = res;
  return products;
};
export default getFeaturedProducts;

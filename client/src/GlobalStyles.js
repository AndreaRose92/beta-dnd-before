import { createGlobalStyle } from "styled-components";

const GlobalStyles = createGlobalStyle`

  * {
    font-family: 'Draconis';
    /* font-family: 'Cinzel', serif; */
    color: black;
    text-decoration: none;
    margin: 0;
  }

  h1 {
    font-size: 2.7rem;
  }

  body {
    height: 100%;
    width: 100%;
    /* min-width: 1920px; */
    background: radial-gradient(farthest-corner at 40px 40px,
    #fff 0%, #d4af37 100%);
  }

  h2 {
    font-size: 1.5rem;
  }

  p {
    font-size: 10px;
  }

`
export default GlobalStyles
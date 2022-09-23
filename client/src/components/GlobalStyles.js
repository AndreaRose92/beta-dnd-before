import { createGlobalStyle } from "styled-components";

const GlobalStyles = createGlobalStyle`
  @import url('//db.onlinewebfonts.com/c/2eba1e44ff150d867122736d358c496f?family=Draconis');

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
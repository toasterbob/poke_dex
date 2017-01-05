import React from 'react';
import { Link } from 'react-router';


export default ({ pokemon }) => (

    <li>
      <Link to="/pokemon/:pokemonId">
        {pokemon.name}
        <br />
        <img className="small" height='75' src={pokemon.image_url} />
      </Link>
      <hr />
    </li>
);

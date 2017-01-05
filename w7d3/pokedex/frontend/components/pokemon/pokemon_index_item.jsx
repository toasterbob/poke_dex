import React from 'react';
import { Link } from 'react-router';



export default ({ pokemon }) => {
  const pokemonLink = `/pokemon/${pokemon.id}`;
  return (
    <li>
      <Link to={pokemonLink}>
        {pokemon.name}
        <br />
        <img className="small" height='75' src={pokemon.image_url} />
      </Link>
      <hr />
    </li>
  );
};

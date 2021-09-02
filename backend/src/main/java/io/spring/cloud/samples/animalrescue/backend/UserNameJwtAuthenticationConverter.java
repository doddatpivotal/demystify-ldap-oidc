package io.spring.cloud.samples.animalrescue.backend;

import java.util.Collection;

import lombok.extern.java.Log;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;

@Log
class UserNameJwtAuthenticationConverter implements Converter<Jwt, AbstractAuthenticationToken> {

	private final Converter<Jwt, Collection<GrantedAuthority>> jwtGrantedAuthoritiesConverter
		= new JwtGrantedAuthoritiesConverter();

	@Override
	public AbstractAuthenticationToken convert(Jwt jwt) {
		log.info(jwt.getTokenValue());
		Collection<GrantedAuthority> authorities = this.jwtGrantedAuthoritiesConverter.convert(jwt);
		return new JwtAuthenticationToken(jwt, authorities, getUserName(jwt));
	}

	private String getUserName(Jwt jwt) {
		return jwt.containsClaim("name") ? jwt.getClaimAsString("name") : jwt.getSubject();
	}
}

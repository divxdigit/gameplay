package be.thomasmore.graduaten.gameplay.authentication;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import be.thomasmore.graduaten.gameplay.entity.User;
import be.thomasmore.graduaten.gameplay.entity.UserType;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MyUserDetails implements UserDetails {

    private User user;

    public MyUserDetails(User user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(user.getType().getName());
        return Arrays.asList(authority);
    }

    @Override
    public String getPassword() { return user.getPassword(); }

    @Override
    public String getUsername() {
        return user.getEmail();
    }

    public String getFirstname() {
        return user.getFirstname();
    }
    public String getLastname() {
        return user.getLastname();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}

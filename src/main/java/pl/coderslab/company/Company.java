package pl.coderslab.company;

import jakarta.persistence.*;
import lombok.Generated;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.client.Client;

import java.util.List;

@Entity
@Table(name = "company")
@Getter
@Setter
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    @Column(length = 50)
    public String name;
    @Column(length = 15)
    public String nip;
    @Column(length = 100)
    public String address;
    @OneToMany(mappedBy = "company")
    public List<Client> client;

}

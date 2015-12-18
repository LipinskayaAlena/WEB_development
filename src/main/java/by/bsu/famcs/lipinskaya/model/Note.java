package by.bsu.famcs.lipinskaya.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "note")
public class Note implements Serializable{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "note_id", nullable = false)
    private long note_id;
    
    @Column(name="note_text", nullable = false)
    private String note_text;

    @Column(name="note_date", nullable = false)
    private Date note_date;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_user", nullable = false)
    private Person person;

    public long getNote_id() {
        return note_id;
    }

    public void setNote_id(long note_id) {
        this.note_id = note_id;
    }

    public String getNote_text() {
        return note_text;
    }

    public void setNote_text(String note_text) {
        this.note_text = note_text;
    }

    public Date getNote_date() {
        return note_date;
    }

    public void setNote_date(Date note_date) {
        this.note_date = note_date;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
}

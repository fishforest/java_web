package com.example.hibernate.dao;

import com.example.hibernate.model.HiUser;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class UserDAO {

    private static final SessionFactory sessionFactory;

    static {
        try {
            long startTime = System.currentTimeMillis();
            sessionFactory = new Configuration().configure().buildSessionFactory();
            System.out.println("Initial SessionFactory creation time: " + (System.currentTimeMillis() - startTime));
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public void saveUser(HiUser user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public List<HiUser> getUsers() {
        long startTime = System.currentTimeMillis();
        try (Session session = sessionFactory.openSession()) {
            List<HiUser> list = session.createQuery("from HiUser", HiUser.class).list();
            System.out.println("getUsers time: " + (System.currentTimeMillis() - startTime));
            return list;
        }
    }

    public void updateUser(HiUser user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteUser(HiUser user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.delete(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public HiUser getUserById(Long id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(HiUser.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
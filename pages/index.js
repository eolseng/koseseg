import Head from 'next/head'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>Viktig å kose seg</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>
          Vi skal kose oss i Son!
        </h1>
      </main>

      <footer className={styles.footer}>
        Kose seg crew  ©
      </footer>
    </div>
  )
}
